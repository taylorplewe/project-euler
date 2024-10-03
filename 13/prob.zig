const std = @import("std");

pub fn main() !void {
    // get all file contents into buf
    const file = try std.fs.cwd().openFile("nums.txt", .{});
    const size = try file.getEndPos();
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const buf = try allocator.alloc(u8, size);
    _ = try file.readAll(buf);

    // split on newlines
    var lines = std.ArrayList([]const u8).init(allocator);
    var it = std.mem.splitAny(u8, buf, "\n\r");
    while (it.peek() != null) {
        try lines.append(it.next().?);
    }

    // for each column, take sum and *= 10
    const lineLen = lines.items[0].len;
    const numLines = 100;
    var res: u64 = 0;
    for (0..lineLen) |col| {
        res *= 10;
        for (0..numLines) |row| {
            res += try std.fmt.charToDigit(lines.items[row][col], 10);
            if (col == 0) {
                std.debug.print("num: {d} res: {d}\n", .{ try std.fmt.charToDigit(lines.items[row][col], 10), res });
            }
        }
        if (isThirteenDigits(res)) break;
    }
    if (!isThirteenDigits(res)) {
        std.debug.print("result wasn't even ten digits??\n", .{});
    } else {
        std.debug.print("{d}\n", .{res});
    }
}

fn isThirteenDigits(num: u64) bool {
    var numDigits: u8 = 0;
    var _num = num;
    while (_num > 0) : (_num /= 10) {
        numDigits += 1;
    }
    return numDigits >= 13;
}
