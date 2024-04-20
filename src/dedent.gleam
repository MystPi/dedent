import gleam/int
import gleam/list
import gleam/result
import gleam/string

/// Remove shared indentation from each line of the given string. Leading and
/// trailing whitespace is also removed.
///
/// ```
/// dedent(
///   "
///   I am at level one
///
///     * level two
///     - level two
///       - level three
///
///   > That's it!
///   ",
/// )
///
/// // Results in:
///
/// "I am at level one
///
///   * level two
///   - level two
///     - level three
///
/// > That's it!"
/// ```
///
pub fn dedent(text: String) -> String {
  let lines =
    text
    |> string.split("\n")

  let min_indent =
    lines
    |> list.filter(fn(line) { !is_all_whitespace(line) })
    |> list.map(indent_size(_, 0))
    |> list.sort(int.compare)
    |> list.first
    |> result.unwrap(0)

  lines
  |> list.map(string.drop_left(_, min_indent))
  |> string.join("\n")
  |> string.trim
}

fn indent_size(text: String, size: Int) -> Int {
  case text {
    " " <> rest | "\t" <> rest -> indent_size(rest, size + 1)
    _ -> size
  }
}

fn is_all_whitespace(text: String) -> Bool {
  text
  |> string.trim
  |> string.is_empty
}
