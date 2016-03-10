context("subtractSquares")

test_that("You suck", {
  expect_that(subtractSquares(2,3),
              equals(new("Squares", square=(0), x = 2, y = 3)))
  expect_warning(subtractSquares("PeePee", 3))
  expect_error(subtractSquares("PeePee", 3))
  expect_is(subtractSquares(1,2), "Squares")
})