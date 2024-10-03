const std = @import("std");

pub fn main() void {
    var longestSeq: u64 = 0;
    var longestSeqStartingNum: u64 = 0;
    for (1..1_000_000) |n| {
        const seqLen = getCollatzSeqLen(n);
        if (seqLen > longestSeq) {
            longestSeq = seqLen;
            longestSeqStartingNum = n;
            std.debug.print("new highest: {d}\n", .{n});
        }
    }
    std.debug.print("starting number: {d}\nsequence length: {d}\n", .{longestSeqStartingNum, longestSeq});
}

fn getCollatzSeqLen(start: u64) u64 {
    var n: u64 = start;
    var seqLen: u64 = 1;
    while (n != 1) {
        if (n & 1 == 0) {
            n /= 2;
        } else {
            n = n * 3 + 1;
        }
        seqLen += 1;
    }
    return seqLen;
}
