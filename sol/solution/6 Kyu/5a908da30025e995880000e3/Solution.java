/*
Solution
*/
public class SimplePrimeStreaming {
    public static String solve(int a, int b) {
        StringBuilder sb = new StringBuilder(a + b + 100); // preallocate
        java.util.List<Integer> primes = new java.util.ArrayList<>();
        for (int n = 2; sb.length() < a + b; n++) {
            if (isPrime(n, primes)) {
                primes.add(n);
                sb.append(n);
            }
        }
        return sb.substring(a, a + b);
    }
    private static boolean isPrime(int n, java.util.List<Integer> primes) {
        if (n < 2) return false;
        int limit = (int) Math.sqrt(n);
        for (int p : primes) {
            if (p > limit) break;
            if (n % p == 0) return false;
        }
        return true;
    }
}





/*
Sample Tests
*/
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import org.junit.runners.JUnit4;

public class SampleTest {
    @Test
    public void basicTests() {
        doTest(    2,  2, "57");
        doTest(   10,  3, "192");
        doTest(   20,  9, "414347535");
        doTest(   30, 12, "616771737983");
        doTest(   40,  8, "83899710");
        doTest(   50,  6, "031071");
        doTest(10000,  5, "02192");
        doTest(20000,  5, "09334");
    }
    private void doTest(int a, int b, String expected) {
        assertEquals(expected, SimplePrimeStreaming.solve(a, b));
    }
}