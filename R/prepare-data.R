#' Converts the human proteome, as downloaded from UniProt,
#' into a more convenient data structure to work with: a named
#' list of strings.
#'
#' Also creates a few other files that are helpful for the analysis.
#'
#' Proteome is downloaded from:
#'
#'   ftp://ftp.ebi.ac.uk/pub/databases/reference_proteomes/
#'     QfO/Eukaryota/UP000005640_9606.fasta.gz
#'
#' Proteome used in Bianchi et al., 2017 used:
#'
#'   https://github.com/richelbilderbeek/bianchi_et_al_2017/raw/master/proteome_2017/UP000005640_9606.fasta.gz
#'
#' @param fasta_filename proteome as FASTA file,
#'   for example `proteome/UP000005640_9606.fasta.gz`:
#' @param trans_membrane_analysis_filename Filename for
#'   uhhh, something, for example
#'   `tmh-predictions/trans-membrane-analysis-shortened.txt`
#' @param protein_lengths_filename filename to store the
#'   length of all proteins in proteome,
#'   for example `work/protein-lengths.txt`
#' @param proteome_as_data_filename filename to store the
#'   proteome in R data format,
#'   for example `work/proteome.Rdata`
#' @param tmh_9mers_as_data_filename filename to store
#'   per TMH protein, the indices at which it is TMH,
#'   in R data format.
#'   for example `work/tmh.9mers.Rdata`
#' @author Richel J.C. Bilderbeek, adapted from Johannes Textor
#' @export
prepare_data <- function(
  fasta_filename,
  trans_membrane_analysis_filename,
  protein_lengths_filename,
  proteome_as_data_filename,
  tmh_9mers_as_data_filename
) {
  testthat::expect_true(file.exists(fasta_filename))
  testthat::expect_true(file.exists(trans_membrane_analysis_filename))

  x <- seqinr::read.fasta(fasta_filename,
  	forceDNAtolower = FALSE, as.string = TRUE )
  x <- lapply( x, function(x) x[1] )
  names( x ) <- sapply( strsplit( names(x), "\\|" ), function(x) x[2] )

  # Save protein lengths to file
  sink(protein_lengths_filename)
  for( i in seq_along(x) ){
          cat(names(x)[i]," ",nchar(x[[i]]),"\n",sep="")
  }
  sink()
  testthat::expect_true(file.exists(protein_lengths_filename))

  proteome <- x
  save(proteome,file = proteome_as_data_filename)
  # $A0A024R1R8
  # [1] "MSSHEGGKKKALKQPKKQAKEMDEEEKAFKQKQKEEQKKLEVLKAKVVGKGPLATGGIKKSGKK"
  #
  # $A0A024RBG1
  # [1] "MMKFKPNQTRTYDREGFKKRAACLCFRSEQEDEVLLVSSSRYPDQWIVPGGGMEPEEEPGGAAVREVYEEAGVKGKLGRLLGIFEQNQDRKHRTYVYVLTVTEILEDWEDSVNIGRKREWFKVEDAIKVLQCHKPVHAEYLEKLKLGCSPANGNSTVPSLPDNNALFVTAAQTSGLPSSVR"
  #
  # $A0A075B6H5
  # [1] "METVVTTLPREGGVGPSRKMLLLLLLLGPGSGLSAVVSQHPSRVICKSGTSVNIECRSLDFQATTMFWYRQLRKQSLMLMATSNEGSEVTYEQGVKKDKFPINHPNLTFSALTVTSAHPEDSSFYICSAR"


  # generate a list containing the starting position of all 9mers overlapping
  # with predicted transmembrane helices

  testthat::expect_true(file.exists(trans_membrane_analysis_filename))
  x <- utils::read.table(trans_membrane_analysis_filename)
  #             V1      V2   V3   V4
  # 1   A0A075B6K6  inside    1    1
  # 2   A0A075B6K6 TMhelix    2   24
  # 3   A0A075B6K6 outside   25  122
  # 4   A0A075B734  inside    1   40
  testthat::expect_true(all(x$V2 %in% c("inside", "TMhelix", "outside")))

  # Select only the TMH
  x <- x[x$V2 == "TMhelix", c(1,3,4)]
  #             V1   V3   V4
  # 2   A0A075B6K6    2   24
  # 5   A0A075B734   41   63
  # 7   A0A075B734   68   90
  # 9   A0A075B734  124  146

  # Convert from (name, from_index, to_index) to a name with the actual
  # sequence from [from_index - 8, to_index]
  # NOTE: I have no idea why 'from_index - 8' is used
  #
  #
  x <- tapply( 1:nrow(x), list(x$V1),
  	function(p) do.call( c, lapply( p, function(k) seq(x[k,2] - 8, x[k,3])) )  )
  # $A0A075B6K6
  #  [1] -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
  #
  # $A0A075B734
  #   [1]  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55
  #  [24]  56  57  58  59  60  61  62  63  60  61  62  63  64  65  66  67  68  69  70  71  72  73  74
  #  [47]  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90 116 117 118 119 120 121 122
  #  [70] 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145
  #  [93] 146 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169
  # [116] 170 171 172 173 174 175 176 177 178 191 192 193 194 195 196 197 198 199 200 201 202 203 204
  # [139] 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 251 252 253 254 255 256
  # [162] 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279
  # [185] 280 281
  #
  # $A0A087WTH1
  #  [1]  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46
  # [24]  47  48  49  50  51  52  53  54  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84
  # [47]  85  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100

  for (protein_name in names(x)) {
    if (is.null(proteome[[protein_name]])) {
      next
    }
    testthat::expect_true(!is.null(x[[protein_name]]))
    indices <- x[[protein_name]]
    protein_sequence <- proteome[[protein_name]]
    protein_sequence_length <- nchar(protein_sequence)
  	x[[protein_name]] <- intersect(
  	  indices,
  	  1:(protein_sequence_length - 8)
  	)
  }
  for( i in names(proteome) ){
  	if( is.null(x[[i]]) ){
  		x[[i]] <- integer(0)
  	}
  }
  tmh.9mers <- x
  save(tmh.9mers, file = tmh_9mers_as_data_filename)

  # Head:
  #
  # $A0A075B6K6
  #  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
  #
  # $A0A075B734
  #   [1]  33  34  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55
  #  [24]  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78
  #  [47]  79  80  81  82  83  84  85  86  87  88  89  90 116 117 118 119 120 121 122 123 124 125 126
  #  [70] 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 148 149 150
  #  [93] 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173
  # [116] 174 175 176 177 178 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208
  # [139] 209 210 211 212 213 214 215 216 217 218 219 220 221 251 252 253 254 255 256 257 258 259 260
  # [162] 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281
  #
  # $A0A087WTH1
  #  [1]  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40  41  42  43  44  45  46
  # [24]  47  48  49  50  51  52  53  54  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84
  # [47]  85  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100
}
