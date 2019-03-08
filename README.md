# lambda.calcue
λ A lambda calculus expression interpreter
> This project evaluates a given lambda expression, and returns our term in beta normal form. 

### How To Run

1. Compile the application's entry point (if required).

```bash
$ ozc -c EntryPoint.oz
```

2. Run with OzEngine

```bash
$ ozengine EntryPoint.ozf -e "lam(x x)"
```

### Abstract Syntax Tree (BNF)

```oz
expr := <id>                      free variable
        lam(<id> <expr>)          abstraction λ<id>.<expr>
        apply(<expr> <expr>)      application
        let(<id>#<expr> <expr>)   let <id> = <expr> in <expr> 
```

## Authors

* **Alexandru Stoica** - *Initial work* - [Master](https://github.com/alexandrustoica/lambda.calcue)

See also the list of [contributors](https://github.com/alexandrustoica/lambda.calcue/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
