//Given an integer x, return true if x is a palindrome, and false otherwise. 
//
// 
// Example 1: 
//
// 
//Input: x = 121
//Output: true
//Explanation: 121 reads as 121 from left to right and from right to left.
// 
//
// Example 2: 
//
// 
//Input: x = -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it 
//becomes 121-. Therefore it is not a palindrome.
// 
//
// Example 3: 
//
// 
//Input: x = 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
// 
//
// 
// Constraints: 
//
// 
// -2³¹ <= x <= 2³¹ - 1 
// 
//
// 
//Follow up: Could you solve it without converting the integer to a string?
//
// Related Topics Math 👍 15177 👎 2890


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    // Solution 1
//    public boolean isPalindrome(int x) {
//        // Check the number
//        String sx = String.valueOf(x);
//        if (sx.length() == 1) {
//            return true;
//        }
//        // check the logic 2 point
//        int i = 0;
//        int j = sx.length()-1;
//        while (i < j) {
//            if(sx.charAt(i) != sx.charAt(j)) {
//                return false;
//            }
//            i++;
//            j--;
//        }
//        return true;
//    }
    // Solution 2
    public boolean isPalindrome(int x) {
        if (x < 0 || (x % 10 == 0 && x != 0)) {
            return false;
        }

        int revertedHalf = 0;
        // Reverse
        while (x > revertedHalf) {
            int digit = x % 10;
            revertedHalf = revertedHalf * 10 + digit;
            x /= 10;
        }

        return x == revertedHalf || x == revertedHalf / 10;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
