## common-prolog-frontend (cpf)

A lex and yacc-based front-end for Prolog.

- Build the front-end with the `bin` rule, and run the tests with `test`.
- Using `cpf` for your own project should be self-explanatory from the Makefile.

### Supported operators:
`\\+`, `^`, `+`, `-`, `*`, `/`, `<`, `<=`, `>`, `>=`,
`(`, `)`, `[`, `]`, `|`, `,`, `;`, `:-`, `.`, `is`, `=`
- The rest included in most Prolog distributions should not be too hard to add. I am not including them here
because each versions' supported operators may vary, and this aims to be a common base for any Prolog distribution.

- Errors are reported for malformed multi-line comments, unrecognized tokens, and invalid token sequences.

### Dependencies
- lex, yacc, and lldb (for debugging when developing the tool further).

### Note:
- Before building for the first time, you will need to create a `dist` directory.
