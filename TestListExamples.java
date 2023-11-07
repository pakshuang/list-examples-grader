import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

class EvenStringChecker implements StringChecker {
  public boolean checkString(String s) {
      return s.length() % 2 == 0;
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testFilter() {
      List<String> input1 = Arrays.asList("a", "bb", "ccc", "dddd", "eeeee");
      List<String> expected1 = Arrays.asList("bb", "dddd");
      assertEquals(expected1, ListExamples.filter(input1, new EvenStringChecker()));
  }

  @Test(timeout = 500)
  public void testMerge() {
      List<String> input1 = Arrays.asList("a", "c", "e", "g");
      List<String> input2 = Arrays.asList("b", "d", "f", "h");
      List<String> expected1 = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
      assertEquals(expected1, ListExamples.merge(input1, input2));
  }
}