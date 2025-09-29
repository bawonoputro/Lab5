
#get_municipalities

test_that("get_municipalities returns a data frame", {
  result <- get_municipalities()
  expect_s3_class(result, "data.frame")
})

test_that("get_municipalities returns expected columns", {
  result <- get_municipalities()
  expect_true(all(c("id", "title", "type") %in% names(result)))
})

test_that("get_municipalities can handle multiple rapid requests", {
  results <- lapply(1:10, function(x) get_municipalities())
  expect_true(all(sapply(results, function(res) nrow(res) > 0)))
})

test_that("get_municipalities returns consistent results", {
  result1 <- get_municipalities()
  result2 <- get_municipalities()
  expect_equal(nrow(result1), nrow(result2))
})



#get_kpi
test_that("get_kpi returns a dataframe", {
  result <- get_kpi()
  expect_s3_class(result, "data.frame")
})

test_that("get_kpi returns expected columns", {
  result <- get_kpi()
  expect_true(all(c("id", "title", "description", "is_divided_by_gender",
                    "municipality_type", "auspice", "operating_area",
                    "perspective", "prel_publication_date", "publication_date",
                    "publ_period",  "has_ou_data") %in% names(result)))
})

test_that("get_kpi is able to download big queries", {
  result <- get_kpi()
  expect_true(nrow(result)> 1000)
})

test_that("get_kpi can handle multiple rapid requests", {
  results <- lapply(1:10, function(x) get_kpi())
  expect_true(all(sapply(results, function(res) nrow(res) > 0)))
})

test_that("get_kpi returns consistent results", {
  result1 <- get_kpi()
  result2 <- get_kpi()
  expect_equal(nrow(result1), nrow(result2))
})



#get_ou

test_that("get_ou returns a dataframe", {
  result <- get_ou()
  expect_s3_class(result, "data.frame")
})

test_that("get_ou returns expected columns", {
  result <- get_ou()
  expect_true(all(c("id", "title", "municipality") %in% names(result)))
})

test_that("get_ou is able to download big queries", {
    result <- get_ou()
    expect_true(nrow(result)> 1000)
})

test_that("get_ou can handle multiple rapid requests", {
  results <- lapply(1:10, function(x) get_ou())
  expect_true(all(sapply(results, function(res) nrow(res) > 0)))
})

test_that("get_ou returns consistent results", {
  result1 <- get_ou()
  result2 <- get_ou()
  expect_equal(nrow(result1), nrow(result2))
})
