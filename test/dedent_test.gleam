import birdie
import dedent.{dedent}
import gleeunit

pub fn main() {
  gleeunit.main()
}

pub fn dedent_test() {
  "
  I am at level one

    * level two
    - level two
      - level three

  > That's it!
  "
  |> dedent
  |> birdie.snap("shared indentation is removed")
}

pub fn min_indent_test() {
  "hello
  world

    goodbye
      universe"
  |> dedent
  |> birdie.snap("no identation is removed")
}

pub fn tabs_test() {
  "\t\tA
\t\t\tB
\t\tC"
  |> dedent
  |> birdie.snap("tabs are considered as indentation")
}

pub fn trim_test() {
  "

        A
        B
        C

    "
  |> dedent
  |> birdie.snap("leading and trailing whitespace is removed")
}

pub fn one_line_test() {
  "hello world"
  |> dedent
  |> birdie.snap("one line with no indentation is not modified")
}
