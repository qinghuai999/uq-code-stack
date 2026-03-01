//Given a 32-bit integer num, return a string representing its hexadecimal 
//representation. For negative integers, two’s complement method is used. 
//
// All the letters in the answer string should be lowercase characters, and 
//there should not be any leading zeros in the answer except for the zero itself. 
//
// Note: You are not allowed to use any built-in library method to directly 
//solve this problem. 
//
// 
// Example 1: 
// Input: num = 26
//Output: "1a"
// 
// Example 2: 
// Input: num = -1
//Output: "ffffffff"
// 
// 
// Constraints: 
//
// 
// -2³¹ <= num <= 2³¹ - 1 
// 
//
// Related Topics Math String Bit Manipulation 👍 1436 👎 229


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public String toHex(int num) {
        if (num == 0) return "0";

        char[] map = "0123456789abcdef".toCharArray();
        StringBuilder res = new StringBuilder();

        while (num != 0) {
            int last4Bits = num & 0xf;
            res.append(map[last4Bits]);
            num >>>= 4;
        }

        return res.reverse().toString();
    }
}
//leetcode submit region end(Prohibit modification and deletion)
