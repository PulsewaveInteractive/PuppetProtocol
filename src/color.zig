const raylib = @cImport({
    @cInclude("raylib.h");
});
pub const demo = raylib.Color {
    .r = 112,
    .g = 73,
    .b = 21,
    .a = 150
};