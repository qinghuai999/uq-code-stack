//Given an array nums containing n distinct numbers in the range [0, n], return 
//the only number in the range that is missing from the array. 
//
// 
// Example 1: 
//
// 
// Input: nums = [3,0,1] 
// 
//
// Output: 2 
//
// Explanation: 
//
// n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is 
//the missing number in the range since it does not appear in nums. 
//
// Example 2: 
//
// 
// Input: nums = [0,1] 
// 
//
// Output: 2 
//
// Explanation: 
//
// n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is 
//the missing number in the range since it does not appear in nums. 
//
// Example 3: 
//
// 
// Input: nums = [9,6,4,2,3,5,7,0,1] 
// 
//
// Output: 8 
//
// Explanation: 
//
// n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is 
//the missing number in the range since it does not appear in nums. 
//
// 
// 
// 
// 
// 
// 
// 
//
// 
// 
// 
// 
// 
// 
// 
//
// 
// 
// 
//
// 
//
// 
// Constraints: 
//
// 
// n == nums.length 
// 1 <= n <= 10⁴ 
// 0 <= nums[i] <= n 
// All the numbers of nums are unique. 
// 
//
// 
// Follow up: Could you implement a solution using only O(1) extra space 
//complexity and O(n) runtime complexity? 
//
// Related Topics Array Hash Table Math Binary Search Bit Manipulation Sorting ?
//? 14098 👎 3463


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int missingNumber(int[] nums) {
        // Approach 1: time and space complexity O(n)
//        int n = nums.length;
//        HashSet<Integer> set = new HashSet<>();
//        for (int i = 0; i < n; i++) {
//            if (!set.contains(nums[i])) {
//                set.add(nums[i]);
//            }
//        }
//
//        for (int i = 0; i <= n; i++) {
//            if (!set.contains(i)) {
//                return i;
//            }
//        }
//        return -1;

        // Approach 2: time O(n), Space O(1)
        int n = nums.length;
        int expect = n * (n + 1) / 2;
        int sum = 0;
        for (int i = 0; i < n; i++) {
            sum += nums[i];
        }
        return expect - sum;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
