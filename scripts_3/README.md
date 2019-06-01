# `scripts_3`

Answers the third question of the BBBQ: are known eluates indeed bound?

Script is in `epitopeome/cpp/test_do_elutes_bind.cpp`, see `Code` below.

## Result

First row of [results.csv](results.csv):

|name                            |protein_sequence    |elute_sequence  |location_sequence    | n_m|
|:-------------------------------|:------------------------------------|---------------------|---:|
|sp&#124;I6YET7&#124;Y2963_MYCTU |MTSTKVEDRVTAAVLG... |AFIFADLLILPILNI |iiiiiiiiiiiiiiiii... |  10|

## Code

Just not to loose it ...

```
/// Answers the BBBQ 3rd question: do elutes bind in the membrane?
BOOST_AUTO_TEST_CASE(test_do_elutes_bind)
{
  const std::string proteome_filename = "/home/richel/GitHubs/bbbq/inst/extdata/UP000001584_83332.fasta";
  const std::string locatome_filename = "/home/richel/UP000001584_83332.loc";
  const std::string output_filename = "/home/richel/for_frans_no_zeroes.csv";
  std::ofstream output(output_filename.c_str());
  {
    output << "name,protein_sequence,elute_sequence,location_sequence,n_m\n";
  }
  if (1 == 1)
  {
    std::stringstream cmd;
    cmd << "Rscript -e "
      << "'tmhmm::run_tmhmm_to_file(\""
      << proteome_filename << "\", \""
      << locatome_filename << "\")"
      << "'"
    ;
    std::cerr << cmd.str();
    std::system(cmd.str().c_str());
  }
  const auto proteome = create_locatome_cpp(proteome_filename);
  const auto locatome = create_locatome_cpp(locatome_filename);
  const auto elutes = file_to_vector("/home/richel/GitHubs/bbbq/scripts_3/elutes.txt");
  for (const auto& protein: proteome)
  {
    const auto& name = protein.first;
    const std::string sequence = boost::algorithm::to_upper_copy(protein.second);

    for (const auto& elute: elutes)
    {
      if (elute.size() < 13) continue;
      if (elute.size() > 17) continue;
      if (sequence.find(elute) != std::string::npos)
      {
        const int dist = sequence.find(elute);
        assert(dist >= 0);
        assert(locatome.find(name) != end(locatome));
        const auto this_locatome = locatome.find(name)->second;
        const auto this_elute_locatome = this_locatome.substr(dist, elute.size());
        const int n_m = std::count(std::begin(this_elute_locatome), std::end(this_elute_locatome), 'm');
        if (n_m == 0) continue;
        if (1 == 2)
        {
          std::cout
            << "Elute found.\n"
            << "Elute: " << elute << "\n"
            << "Sequence: " << sequence << "\n"
            << "Here    : " << std::string(dist, ' ') << std::string(elute.size(), '^') << "\n"
            << "Locatome: " << this_locatome << "\n"
            << "Here    : " << std::string(dist, ' ') << this_elute_locatome << "\n"
            << "n_m: " << n_m << '\n'
          ;
        }
        output
          << name << ","
          << sequence << ","
          << elute << ","
          << this_locatome
          << ","
          << n_m
          << '\n'
        ;
      }
    }
  }

  std::cout << "DONE";
}
```