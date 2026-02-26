package au.edu.uq.codestack.algorithms.week1;
/**
 * @Author: Kiki Su
 * @CreateDate: 2026-02-26 09:53:52
 * @Description: Recursive
 */
public class FibonacciSequence {
    // Approach 1: Iteration
    public int fibonacci(int n) {
        if (n == 0 || n == 1) {
            return n;
        }
        int a = 0;
        int b = 1;
        for (int i = 2; i <= n; i++) {
            int c = a + b;
            a = b;
            b = c;
        }
        return b;
    }

    // Approach 2: Recursive
    public int fibonacciR(int n) {
        if (n == 0 || n == 1) {
            return n;
        }
        return fibonacciR(n - 1) + fibonacciR(n - 2);
    }

    public static void main(String[] args) {
        FibonacciSequence fb = new FibonacciSequence();
        int result = fb.fibonacciR(10);
        System.out.println(result);
    }
}
