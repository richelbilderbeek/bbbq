#include "create_tmh_fasta_cpp.h"

#include <fstream>

void create_tmh_fasta_cpp(
  const std::string& proteome_filename,
  const std::string& tmhs_filename,
  const std::string& tmh_fasta_filename
) {
  std::ofstream f(tmh_fasta_filename.c_str());
  for (int i = 0; i != 16; ++i) {
    f
      << proteome_filename
      << tmhs_filename
      << tmh_fasta_filename
      << '\n'
    ;
  }
}
