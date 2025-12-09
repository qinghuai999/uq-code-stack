//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']
//', determine if the input string is valid. 
//
// An input string is valid if: 
//
// 
// Open brackets must be closed by the same type of brackets. 
// Open brackets must be closed in the correct order. 
// Every close bracket has a corresponding open bracket of the same type. 
// 
//
// 
// Example 1: 
//
// 
// Input: s = "()" 
// 
//
// Output: true 
//
// Example 2: 
//
// 
// Input: s = "()[]{}" 
// 
//
// Output: true 
//
// Example 3: 
//
// 
// Input: s = "(]" 
// 
//
// Output: false 
//
// Example 4: 
//
// 
// Input: s = "([])" 
// 
//
// Output: true 
//
// Example 5: 
//
// 
// Input: s = "([)]" 
// 
//
// Output: false 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 10⁴ 
// s consists of parentheses only '()[]{}'. 
// 
//
// Related Topics String Stack 👍 27072 👎 1962


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public boolean isValid(String s) {
        // Check if it is the even number
        if (s.length() % 2 != 0) {
            return false;
        }
        // Create a HashMap to save the pairs
        HashMap<Character, Character> hMap = new HashMap<>();
        hMap.put(')', '(');
        hMap.put(']', '[');
        hMap.put('}', '{');

        // Create a stack data structure
        Stack<Character> stack = new Stack<>();
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '(' || s.charAt(i) == '[' || s.charAt(i) == '{') {
                stack.push(s.charAt(i));
                continue;
            }
            if (stack.isEmpty() || hMap.get(s.charAt(i)) != stack.pop()) {
                return false;
            }
        }

        // Confirm the stack number
        if (stack.isEmpty()) {
            return true;
        }
        return false;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
