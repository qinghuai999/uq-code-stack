//Given two strings s and t, return true if t is an anagram of s, and false 
//otherwise. 
//
// 
// Example 1: 
//
// 
// Input: s = "anagram", t = "nagaram" 
// 
//
// Output: true 
//
// Example 2: 
//
// 
// Input: s = "rat", t = "car" 
// 
//
// Output: false 
//
// 
// Constraints: 
//
// 
// 1 <= s.length, t.length <= 5 * 10⁴ 
// s and t consist of lowercase English letters. 
// 
//
// 
// Follow up: What if the inputs contain Unicode characters? How would you 
//adapt your solution to such a case? 
//
// Related Topics Hash Table String Sorting 👍 14075 👎 464


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public boolean isAnagram(String s, String t) {
        if (s.length() != t.length()) {
            return false;
        }
        HashMap<Character, Integer> set = new HashMap<>();
        for (int i = 0; i < s.length(); i++) {
            char value = s.charAt(i);
            set.put(value, set.getOrDefault(value, 0) + 1);
        }

        for (int j = 0; j < t.length(); j++) {
            char value = t.charAt(j);
            if (!set.containsKey(value) || set.get(value) == 0) {
                return false;
            }

            set.put(value, set.get(value) - 1);
        }
        return true;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
