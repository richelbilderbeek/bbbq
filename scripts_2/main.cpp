#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <string>
#include <exception>
#include <iostream>

namespace pt = boost::property_tree;

void xml_to_csv(
  const std::string& xml_filename = "short_vs_all.xml",
  const std::string& csv_filename = "out.csv"
)
{
  std::ofstream out(csv_filename.c_str());
  out
    << "iteration_index" << ','
    << "hit_index" << ','
    << "id" << ','
    << "def" << ','
    << "qseq" << ','
    << "hseq" << ','
    << "e" << '\n'
  ;

  pt::ptree tree;

  pt::read_xml(xml_filename, tree);

  for (const pt::ptree::value_type& iteration: tree.get_child("BlastOutput.BlastOutput_iterations"))
  {
    assert(iteration.first == "Iteration");
    const int iteration_index{iteration.second.get<int>("Iteration_iter-num")};
    for (const pt::ptree::value_type& hit: iteration.second.get_child("Iteration_hits"))
    {
      const int hit_index{hit.second.get<int>("Hit_num")};
      const std::string id{hit.second.get<std::string>("Hit_id")};
      const std::string def{hit.second.get<std::string>("Hit_def")};
      const std::string qseq{hit.second.get<std::string>("Hit_hsps.Hsp.Hsp_qseq")};
      const std::string hseq{hit.second.get<std::string>("Hit_hsps.Hsp.Hsp_hseq")};
      const double e{hit.second.get<double>("Hit_hsps.Hsp.Hsp_evalue")};
      if (e > 1.0e-100) continue;
      out
        << iteration_index << ','
        << hit_index << ','
        << id << ','
        << def << ','
        << qseq << ','
        << hseq << ','
        << e << '\n'
      ;
    }
  }
}

int main()
{
  try
  {
    xml_to_csv();
  }
  catch (std::exception &e)
  {
    std::cout << "Error: " << e.what() << "\n";
  }
}
