//Given a string s, find the first non-repeating character in it and return its 
//index. If it does not exist, return -1. 
//
// 
// Example 1: 
//
// 
// Input: s = "leetcode" 
// 
//
// Output: 0 
//
// Explanation: 
//
// The character 'l' at index 0 is the first character that does not occur at 
//any other index. 
//
// Example 2: 
//
// 
// Input: s = "loveleetcode" 
// 
//
// Output: 2 
//
// Example 3: 
//
// 
// Input: s = "aabb" 
// 
//
// Output: -1 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 10⁵ 
// s consists of only lowercase English letters. 
// 
//
// Related Topics Hash Table String Queue Counting 👍 9724 👎 331


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int firstUniqChar(String s) {
        // Appraoch 1: HashMap
//        HashMap<Character, Integer> hashMap = new HashMap<>();
//        for (char c : s.toCharArray()) {
//            hashMap.put(c, hashMap.getOrDefault(c, 0) + 1);
//        }
//        for (int i = 0; i < s.length(); i++) {
//            if (hashMap.get(s.charAt(i)) == 1) {
//                return i;
//            }
//        }
//        return -1;

        // Approach 2: int[]
        int[] result = new int[26];
        for (char c : s.toCharArray()) {
            result[c - 'a']++;
        }

        for (int i = 0; i < s.length(); i++) {
            if (result[s.charAt(i) - 'a'] == 1) {
                return i;
            }
        }
        return -1;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
