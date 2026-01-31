//Given an integer numRows, return the first numRows of Pascal's triangle. 
//
// In Pascal's triangle, each number is the sum of the two numbers directly 
//above it as shown: 
// 
// 
// Example 1: 
// Input: numRows = 5
//Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
// 
// Example 2: 
// Input: numRows = 1
//Output: [[1]]
// 
// 
// Constraints: 
//
// 
// 1 <= numRows <= 30 
// 
//
// Related Topics Array Dynamic Programming 👍 14786 👎 560


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<List<Integer>> generate(int numRows) {
        // Approach 1: Recursive DP
//        List<List<Integer>> result = new ArrayList<>();
//        if (numRows == 0) {
//            return result;
//        }
//
//        if (numRows == 1) {
//            List<Integer> firstRow = new ArrayList<>();
//            firstRow.add(1);
//            result.add(firstRow);
//            return result;
//        }
//
//        result = generate(numRows - 1);
//        List<Integer> prevRow = result.get(numRows - 2);
//        List<Integer> currentRow = new ArrayList<>();
//        currentRow.add(1);
//
//        for (int i = 1; i < numRows - 1; i++) {
//            currentRow.add(prevRow.get(i - 1) + prevRow.get(i));
//        }
//
//        currentRow.add(1);
//        result.add(currentRow);
//
//        return result;
        // Approach 2: Iterative DP
        List<List<Integer>> result = new ArrayList<>();
        if (numRows == 0) {
            return result;
        }

        List<Integer> firstRow = new ArrayList<>();
        firstRow.add(1);
        result.add(firstRow);

        for (int i = 1; i < numRows; i++) {
            List<Integer> prev = result.get(i - 1);
            List<Integer> cur = new ArrayList<>();
            cur.add(1);

            for (int j = 1; j < i; j++) {
                cur.add(prev.get(j - 1) + prev.get(j));
            }
            cur.add(1);
            result.add(cur);
        }
        return result;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
