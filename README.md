# dedent

Remove shared indentation from a string.

[![Package Version](https://img.shields.io/hexpm/v/dedent)](https://hex.pm/packages/dedent)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/dedent/)

```sh
gleam add dedent
```

```gleam
import gleam/io
import dedent.{dedent}

pub fn main() {
  "
  I am at level one

    * level two
    - level two
      - level three

  > That's it!
  "
  |> dedent
  |> io.println
}
```

Result:

```gleam
"I am at level one

  * level two
  - level two
    - level three

> That's it!"
```

Further documentation can be found at <https://hexdocs.pm/dedent>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
