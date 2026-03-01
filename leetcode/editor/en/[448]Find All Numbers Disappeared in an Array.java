//Given an array nums of n integers where nums[i] is in the range [1, n], 
//return an array of all the integers in the range [1, n] that do not appear in nums. 
//
// 
// Example 1: 
// Input: nums = [4,3,2,7,8,2,3,1]
//Output: [5,6]
// 
// Example 2: 
// Input: nums = [1,1]
//Output: [2]
// 
// 
// Constraints: 
//
// 
// n == nums.length 
// 1 <= n <= 10⁵ 
// 1 <= nums[i] <= n 
// 
//
// 
// Follow up: Could you do it without extra space and in O(n) runtime? You may 
//assume the returned list does not count as extra space. 
//
// Related Topics Array Hash Table 👍 10294 👎 549


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<Integer> findDisappearedNumbers(int[] nums) {
//        int n = nums.length;
//        Set<Integer> oldArray = new HashSet<>();
//        for (int i : nums) {
//            oldArray.add(i);
//        }
//
//        List<Integer> list = new ArrayList<>();
//        for (int i = 1; i <= n; i++) {
//            if (!oldArray.contains(i)) {
//                list.add(i);
//            }
//        }
//        return list;
        int n = nums.length;
        for (int i = 0; i < n; i++) {
            int idx = Math.abs(nums[i]) - 1;
            if (nums[idx] > 0) nums[idx] = -nums[idx];
        }
        List<Integer> ans = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            if (nums[i] > 0) ans.add(i + 1);
        }
        return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
