class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix.first!.isEmpty { return 0 }

        let rows = matrix.count
        let cols = matrix.first!.count
        
        let dpCol = Array(repeating: 0, count: cols + 1)
        var dp = Array(repeating: dpCol, count: rows + 1)
        
        var maxSide = 0
        
        for r in 1...rows {
            for c in 1...cols {
                if matrix[r - 1][c - 1] == "0" { continue }
                var d = min(dp[r - 1][c - 1], dp[r - 1][c])
                d = min(d, dp[r][c - 1])
                d += 1
                dp[r][c] = d    // dp[r][c] is side of largest square with bottom,right at [r-1],[c-1]
                maxSide = max(maxSide, d)
            }
        }
        
        return maxSide * maxSide
    }
}