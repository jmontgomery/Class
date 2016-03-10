context("David")
test_that("David rules, you suck",{
  expect_is( new("David",1,new("Squares",8,2,2)), "David")
  
})