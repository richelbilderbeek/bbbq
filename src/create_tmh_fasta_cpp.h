#ifndef CREATE_TMH_FASTA_CPP_H
#define CREATE_TMH_FASTA_CPP_H

#include <string>

//' Calculate the auto correlation time
//' from \url{https://github.com/beast-dev/beast-mcmc/blob/800817772033c13061f026226e41128d21fd14f3/src/dr/inference/trace/TraceCorrelation.java#L159} # nolint
//' @param sample sample
//' @param sample_interval sample interval
//' @return the auto correlation time
//' @author Richel J.C. Bilderbeek
// [[Rcpp::export]]
void create_tmh_fasta_cpp(
  const std::string& proteome_filename,
  const std::string& tmhs_filename,
  const std::string& tmh_fasta_filename
);

#endif // CREATE_TMH_FASTA_CPP_H



