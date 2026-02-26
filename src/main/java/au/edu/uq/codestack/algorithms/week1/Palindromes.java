package au.edu.uq.codestack.algorithms.week1;


/**
 * @Author: Kiki Su
 * @CreateDate: 2026-02-26 10:31:04
 * @Description: The method determines whether a string is a palindrome
 * by comparing characters from both ends using two pointers.
 */
public class Palindromes {
    public static boolean isPalindromeFor(String word) {
        if (word == null || word.length() <= 1) {
            return true;
        }
        int j = word.length() - 1;
        for (int i = 0; i < j; i++) {
            if (word.charAt(i) == word.charAt(j)) {
                j--;
            } else {
                return false;
            }
        }
        return true;
    }

    public static boolean isPalindromeWhile(String word) {
        if (word == null || word.length() <= 1) {
            return true;
        }
        int left = 0;
        int right = word.length() - 1;
        while (left < right) {
            if (word.charAt(left) == word.charAt(right)) {
                left++;
                right--;
            } else {
                return false;
            }
        }
        return true;
    }

    public static boolean isPalindormeRecursive(String word) {
        if (word == null || word.length() <= 1) {
            return true;
        }

        if (word.charAt(0) != word.charAt(word.length() - 1)) {
            return false;
        }

        return isPalindormeRecursive(word.substring(1, word.length() - 1));
    }

    public static boolean isPalindromeRecursiveWithHelper(String word) {
        if (word == null) return true;
        return helper(word, 0);
    }

    public static boolean helper(String word, int i) {
        if (i >= word.length() / 2) {
            return true;
        }
        if (word.charAt(i) != word.charAt(word.length() - 1 - i)) {
            return false;
        }
        return helper(word, i + 1);
    }

    public static void main(String[] args) {
        boolean result = isPalindromeWhile("AbacbA");
        System.out.println(result);
        boolean isFor = isPalindromeFor("");
        System.out.println(isFor);
    }
}
