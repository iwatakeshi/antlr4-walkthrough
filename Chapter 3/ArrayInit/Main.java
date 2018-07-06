import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
/**
 * Main
 */
public class Main {
  public static void main(String[] args) throws Exception {
    // Create a CharStream that reads from standard input
    ANTLRInputStream input = new ANTLRInputStream(System.in);

    // Create a lexer that feeds off of input CharStream
    ArrayInitLexer lexer = new ArrayInitLexer(input);

    // Create a buffer of tokens pulled from the lexar
    CommonTokenStream tokens = new CommonTokenStream(lexer);

    // Create a parser that feeds off the tokens buffer
    ArrayInitParser parser = new ArrayInitParser(tokens);

    // Begin parsing at init rule
    ParseTree tree = parser.init();

    // Create a generic parse tree walker that can trigger callbacks
    ParseTreeWalker walker = new ParseTreeWalker();
    // Walk the tree created during the parse, trigger callbacks
    walker.walk(new ShortToUnicodeString(), tree);
    System.out.println();

    // Print LISP-style tree
    // System.out.println(tree.toStringTree(parser));
    
    
  }
}