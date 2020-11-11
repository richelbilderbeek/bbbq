#' Performs the same analysis as "calculate-overlap.R", but now for the
#' 'control population' consisting of 9mers that do not overlap with
#' transmembrane helices.
#'
#' Inputs:
#'  * hydrophobe_control_peptides_as_data_filename
#'
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek, adapted from Johannes Textor
hydrophobe_overlap_controls <- function(
  hydrophobe_control_peptides_as_data_filename,
  protein_lengths_filename
) {
  load(hydrophobe_control_peptides_as_data_filename) # Used to be 'load("work/hydrophobe-control-peptides.Rdata")')

  d2 <- utils::unstack(hydrophobe.control.peptides,
  	`9mer` ~ protein)

  pldf <- utils::read.table(protein_lengths_filename, row.names=1 )
  pl <- pldf[,1]
  names(pl) <- rownames(pldf)

  ninemers.in.tmhs <- sapply( d2, length )
  ninemers.total <- pl-8
  ninemers.total[ninemers.total < 0] <- 0

  perc.binders <- function( mhc = "A01-01" ){
  	message( mhc )
  	d <- data.table::fread(paste0("binding-predictions/HLA-",mhc,".txt"), data.table=FALSE)[,c(1,3)]
  	colnames(d) <- c("protein", "start")
  	d <- utils::unstack( d, start ~ protein )
  	binders.in.tmhs <- sapply( names(d) , function(i) length( intersect( d[[i]], d2[[i]] ) ) )
  	c( sum( binders.in.tmhs ), sum( sapply( d, length ) ) )
  }

  hlas <- get_hlas()

  r <- sapply( hlas,
  	perc.binders )

  grDevices::pdf("plots/figure-4-b.pdf",
  	width=4,height=4,useDingbats=FALSE)

  graphics::par( mar=c(6,5,.2,.2) )


  graphics::barplot( 1000 * r[1,] / r[2,], xlab="",
  	ylab="% epitopes overlapping\nwith transmembrane helix", border=NA, las=2 )

  graphics::mtext( "HLA haplotype", 1, line=4.5 )

  pbin <- sum( ninemers.in.tmhs) / sum(ninemers.total)

  ci <- (stats::binom.test( round(0.02*sum(ninemers.in.tmhs)), round(0.02*sum(ninemers.total)), p=pbin,
  	conf.level=0.999  ) )$conf

  graphics::abline( h=1000*ci[1], col=2 )
  graphics::abline( h=1000*ci[2], col=2 )

  grDevices::dev.off()

  for( h in hlas ){
  	cat( h, "\t", stats::binom.test( r[1,h], r[2,h], p=pbin )$p.value," \n" )
  }
}
