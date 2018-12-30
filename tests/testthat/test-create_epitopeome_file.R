context("test-create_epitopeome_file")

test_that("use", {

  if (1 == 2) {

    tmhs_filename <- "~/bbbq/tbc_tmhmm.txt"
    netmhc2pan_filename <- "~/bbbq/tbc_netmhc2pan_bindings_strong.csv"
    testit::assert(file.exists(tmhs_filename))
    testit::assert(file.exists(netmhc2pan_filename))

    epitopeome_filename <- "~/tbc_epitopeome.fasta"
    epitopeome:::create_epitopeome_file_cpp(
      tmhs_filename = tmhs_filename,
      netmhc2pan_filename = netmhc2pan_filename,
      epitopeome_filename = epitopeome_filename
    )
    expect_true(file.exists(epitopeome_filename))
  }
})
