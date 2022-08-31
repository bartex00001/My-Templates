#include <gtest/gtest.h>

#include <ProjectName/lib.hpp>

TEST(SanityCheck, AmIInsane) {
  EXPECT_EQ(1, 1);
}

TEST(CorrectnessTest, SmallTestForSquareFunction) {
  int expected = 2*2;
  int actual = ProjectName::square(2);
  EXPECT_EQ(actual, expected);
}
