#ifndef CREATE_TMH_FASTA_CPP_H
#define CREATE_TMH_FASTA_CPP_H

#include <string>

//' Creates a FASTA fike with only the TMHs
//' @param proteome_filename name of the file the proteome will be stored at
//' @param tmhs_filename file that contains the TMHs as created by TMHMM
//' @param tmh_fasta_filename name of the FASTA file containing only the TMHs
//' @return nothing
//' @author Richel J.C. Bilderbeek
// [[Rcpp::export]]
void create_tmh_fasta_cpp(
  const std::string& proteome_filename,
  const std::string& tmhs_filename,
  const std::string& tmh_fasta_filename
);

#endif // CREATE_TMH_FASTA_CPP_H



