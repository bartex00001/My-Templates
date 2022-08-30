#include <gtest/gtest.h>

#include <ProjectName/lib.hpp>

TEST(SanityCheck, AmIInsane) {
  EXPECT_EQ(1, 1);
}

TEST(SmallTests, TestOnThree) {
  int result = square(3);
  EXPECT_EQ(3*3, result);
}
