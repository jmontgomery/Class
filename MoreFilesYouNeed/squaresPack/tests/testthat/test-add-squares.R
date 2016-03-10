context("Adding squares")
test_that("squares add correctly", {
  expect_that(addSquares(2,3),
              equals(new("Squares", square=(13), x = 2, y = 3)))
  expect_that(addSquares(2,2),
              equals(new("Squares", square=(8), x = 2, y = 2)))
})