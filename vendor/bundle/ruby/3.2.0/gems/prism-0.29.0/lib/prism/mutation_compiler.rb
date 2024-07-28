# frozen_string_literal: true

=begin
This file is generated by the templates/template.rb script and should not be
modified manually. See templates/lib/prism/mutation_compiler.rb.erb
if you are looking to modify the template
=end

module Prism
  # This visitor walks through the tree and copies each node as it is being
  # visited. This is useful for consumers that want to mutate the tree, as you
  # can change subtrees in place without effecting the rest of the tree.
  class MutationCompiler < Compiler
    # Copy a AliasGlobalVariableNode node
    def visit_alias_global_variable_node(node)
      node.copy(new_name: visit(node.new_name), old_name: visit(node.old_name))
    end

    # Copy a AliasMethodNode node
    def visit_alias_method_node(node)
      node.copy(new_name: visit(node.new_name), old_name: visit(node.old_name))
    end

    # Copy a AlternationPatternNode node
    def visit_alternation_pattern_node(node)
      node.copy(left: visit(node.left), right: visit(node.right))
    end

    # Copy a AndNode node
    def visit_and_node(node)
      node.copy(left: visit(node.left), right: visit(node.right))
    end

    # Copy a ArgumentsNode node
    def visit_arguments_node(node)
      node.copy(arguments: visit_all(node.arguments))
    end

    # Copy a ArrayNode node
    def visit_array_node(node)
      node.copy(elements: visit_all(node.elements))
    end

    # Copy a ArrayPatternNode node
    def visit_array_pattern_node(node)
      node.copy(constant: visit(node.constant), requireds: visit_all(node.requireds), rest: visit(node.rest), posts: visit_all(node.posts))
    end

    # Copy a AssocNode node
    def visit_assoc_node(node)
      node.copy(key: visit(node.key), value: visit(node.value))
    end

    # Copy a AssocSplatNode node
    def visit_assoc_splat_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a BackReferenceReadNode node
    def visit_back_reference_read_node(node)
      node.copy
    end

    # Copy a BeginNode node
    def visit_begin_node(node)
      node.copy(statements: visit(node.statements), rescue_clause: visit(node.rescue_clause), else_clause: visit(node.else_clause), ensure_clause: visit(node.ensure_clause))
    end

    # Copy a BlockArgumentNode node
    def visit_block_argument_node(node)
      node.copy(expression: visit(node.expression))
    end

    # Copy a BlockLocalVariableNode node
    def visit_block_local_variable_node(node)
      node.copy
    end

    # Copy a BlockNode node
    def visit_block_node(node)
      node.copy(parameters: visit(node.parameters), body: visit(node.body))
    end

    # Copy a BlockParameterNode node
    def visit_block_parameter_node(node)
      node.copy
    end

    # Copy a BlockParametersNode node
    def visit_block_parameters_node(node)
      node.copy(parameters: visit(node.parameters), locals: visit_all(node.locals))
    end

    # Copy a BreakNode node
    def visit_break_node(node)
      node.copy(arguments: visit(node.arguments))
    end

    # Copy a CallAndWriteNode node
    def visit_call_and_write_node(node)
      node.copy(receiver: visit(node.receiver), value: visit(node.value))
    end

    # Copy a CallNode node
    def visit_call_node(node)
      node.copy(receiver: visit(node.receiver), arguments: visit(node.arguments), block: visit(node.block))
    end

    # Copy a CallOperatorWriteNode node
    def visit_call_operator_write_node(node)
      node.copy(receiver: visit(node.receiver), value: visit(node.value))
    end

    # Copy a CallOrWriteNode node
    def visit_call_or_write_node(node)
      node.copy(receiver: visit(node.receiver), value: visit(node.value))
    end

    # Copy a CallTargetNode node
    def visit_call_target_node(node)
      node.copy(receiver: visit(node.receiver))
    end

    # Copy a CapturePatternNode node
    def visit_capture_pattern_node(node)
      node.copy(value: visit(node.value), target: visit(node.target))
    end

    # Copy a CaseMatchNode node
    def visit_case_match_node(node)
      node.copy(predicate: visit(node.predicate), conditions: visit_all(node.conditions), consequent: visit(node.consequent))
    end

    # Copy a CaseNode node
    def visit_case_node(node)
      node.copy(predicate: visit(node.predicate), conditions: visit_all(node.conditions), consequent: visit(node.consequent))
    end

    # Copy a ClassNode node
    def visit_class_node(node)
      node.copy(constant_path: visit(node.constant_path), superclass: visit(node.superclass), body: visit(node.body))
    end

    # Copy a ClassVariableAndWriteNode node
    def visit_class_variable_and_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ClassVariableOperatorWriteNode node
    def visit_class_variable_operator_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ClassVariableOrWriteNode node
    def visit_class_variable_or_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ClassVariableReadNode node
    def visit_class_variable_read_node(node)
      node.copy
    end

    # Copy a ClassVariableTargetNode node
    def visit_class_variable_target_node(node)
      node.copy
    end

    # Copy a ClassVariableWriteNode node
    def visit_class_variable_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ConstantAndWriteNode node
    def visit_constant_and_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ConstantOperatorWriteNode node
    def visit_constant_operator_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ConstantOrWriteNode node
    def visit_constant_or_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ConstantPathAndWriteNode node
    def visit_constant_path_and_write_node(node)
      node.copy(target: visit(node.target), value: visit(node.value))
    end

    # Copy a ConstantPathNode node
    def visit_constant_path_node(node)
      node.copy(parent: visit(node.parent))
    end

    # Copy a ConstantPathOperatorWriteNode node
    def visit_constant_path_operator_write_node(node)
      node.copy(target: visit(node.target), value: visit(node.value))
    end

    # Copy a ConstantPathOrWriteNode node
    def visit_constant_path_or_write_node(node)
      node.copy(target: visit(node.target), value: visit(node.value))
    end

    # Copy a ConstantPathTargetNode node
    def visit_constant_path_target_node(node)
      node.copy(parent: visit(node.parent))
    end

    # Copy a ConstantPathWriteNode node
    def visit_constant_path_write_node(node)
      node.copy(target: visit(node.target), value: visit(node.value))
    end

    # Copy a ConstantReadNode node
    def visit_constant_read_node(node)
      node.copy
    end

    # Copy a ConstantTargetNode node
    def visit_constant_target_node(node)
      node.copy
    end

    # Copy a ConstantWriteNode node
    def visit_constant_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a DefNode node
    def visit_def_node(node)
      node.copy(receiver: visit(node.receiver), parameters: visit(node.parameters), body: visit(node.body))
    end

    # Copy a DefinedNode node
    def visit_defined_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ElseNode node
    def visit_else_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a EmbeddedStatementsNode node
    def visit_embedded_statements_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a EmbeddedVariableNode node
    def visit_embedded_variable_node(node)
      node.copy(variable: visit(node.variable))
    end

    # Copy a EnsureNode node
    def visit_ensure_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a FalseNode node
    def visit_false_node(node)
      node.copy
    end

    # Copy a FindPatternNode node
    def visit_find_pattern_node(node)
      node.copy(constant: visit(node.constant), left: visit(node.left), requireds: visit_all(node.requireds), right: visit(node.right))
    end

    # Copy a FlipFlopNode node
    def visit_flip_flop_node(node)
      node.copy(left: visit(node.left), right: visit(node.right))
    end

    # Copy a FloatNode node
    def visit_float_node(node)
      node.copy
    end

    # Copy a ForNode node
    def visit_for_node(node)
      node.copy(index: visit(node.index), collection: visit(node.collection), statements: visit(node.statements))
    end

    # Copy a ForwardingArgumentsNode node
    def visit_forwarding_arguments_node(node)
      node.copy
    end

    # Copy a ForwardingParameterNode node
    def visit_forwarding_parameter_node(node)
      node.copy
    end

    # Copy a ForwardingSuperNode node
    def visit_forwarding_super_node(node)
      node.copy(block: visit(node.block))
    end

    # Copy a GlobalVariableAndWriteNode node
    def visit_global_variable_and_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a GlobalVariableOperatorWriteNode node
    def visit_global_variable_operator_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a GlobalVariableOrWriteNode node
    def visit_global_variable_or_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a GlobalVariableReadNode node
    def visit_global_variable_read_node(node)
      node.copy
    end

    # Copy a GlobalVariableTargetNode node
    def visit_global_variable_target_node(node)
      node.copy
    end

    # Copy a GlobalVariableWriteNode node
    def visit_global_variable_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a HashNode node
    def visit_hash_node(node)
      node.copy(elements: visit_all(node.elements))
    end

    # Copy a HashPatternNode node
    def visit_hash_pattern_node(node)
      node.copy(constant: visit(node.constant), elements: visit_all(node.elements), rest: visit(node.rest))
    end

    # Copy a IfNode node
    def visit_if_node(node)
      node.copy(predicate: visit(node.predicate), statements: visit(node.statements), consequent: visit(node.consequent))
    end

    # Copy a ImaginaryNode node
    def visit_imaginary_node(node)
      node.copy(numeric: visit(node.numeric))
    end

    # Copy a ImplicitNode node
    def visit_implicit_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a ImplicitRestNode node
    def visit_implicit_rest_node(node)
      node.copy
    end

    # Copy a InNode node
    def visit_in_node(node)
      node.copy(pattern: visit(node.pattern), statements: visit(node.statements))
    end

    # Copy a IndexAndWriteNode node
    def visit_index_and_write_node(node)
      node.copy(receiver: visit(node.receiver), arguments: visit(node.arguments), block: visit(node.block), value: visit(node.value))
    end

    # Copy a IndexOperatorWriteNode node
    def visit_index_operator_write_node(node)
      node.copy(receiver: visit(node.receiver), arguments: visit(node.arguments), block: visit(node.block), value: visit(node.value))
    end

    # Copy a IndexOrWriteNode node
    def visit_index_or_write_node(node)
      node.copy(receiver: visit(node.receiver), arguments: visit(node.arguments), block: visit(node.block), value: visit(node.value))
    end

    # Copy a IndexTargetNode node
    def visit_index_target_node(node)
      node.copy(receiver: visit(node.receiver), arguments: visit(node.arguments), block: visit(node.block))
    end

    # Copy a InstanceVariableAndWriteNode node
    def visit_instance_variable_and_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a InstanceVariableOperatorWriteNode node
    def visit_instance_variable_operator_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a InstanceVariableOrWriteNode node
    def visit_instance_variable_or_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a InstanceVariableReadNode node
    def visit_instance_variable_read_node(node)
      node.copy
    end

    # Copy a InstanceVariableTargetNode node
    def visit_instance_variable_target_node(node)
      node.copy
    end

    # Copy a InstanceVariableWriteNode node
    def visit_instance_variable_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a IntegerNode node
    def visit_integer_node(node)
      node.copy
    end

    # Copy a InterpolatedMatchLastLineNode node
    def visit_interpolated_match_last_line_node(node)
      node.copy(parts: visit_all(node.parts))
    end

    # Copy a InterpolatedRegularExpressionNode node
    def visit_interpolated_regular_expression_node(node)
      node.copy(parts: visit_all(node.parts))
    end

    # Copy a InterpolatedStringNode node
    def visit_interpolated_string_node(node)
      node.copy(parts: visit_all(node.parts))
    end

    # Copy a InterpolatedSymbolNode node
    def visit_interpolated_symbol_node(node)
      node.copy(parts: visit_all(node.parts))
    end

    # Copy a InterpolatedXStringNode node
    def visit_interpolated_x_string_node(node)
      node.copy(parts: visit_all(node.parts))
    end

    # Copy a ItParametersNode node
    def visit_it_parameters_node(node)
      node.copy
    end

    # Copy a KeywordHashNode node
    def visit_keyword_hash_node(node)
      node.copy(elements: visit_all(node.elements))
    end

    # Copy a KeywordRestParameterNode node
    def visit_keyword_rest_parameter_node(node)
      node.copy
    end

    # Copy a LambdaNode node
    def visit_lambda_node(node)
      node.copy(parameters: visit(node.parameters), body: visit(node.body))
    end

    # Copy a LocalVariableAndWriteNode node
    def visit_local_variable_and_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a LocalVariableOperatorWriteNode node
    def visit_local_variable_operator_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a LocalVariableOrWriteNode node
    def visit_local_variable_or_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a LocalVariableReadNode node
    def visit_local_variable_read_node(node)
      node.copy
    end

    # Copy a LocalVariableTargetNode node
    def visit_local_variable_target_node(node)
      node.copy
    end

    # Copy a LocalVariableWriteNode node
    def visit_local_variable_write_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a MatchLastLineNode node
    def visit_match_last_line_node(node)
      node.copy
    end

    # Copy a MatchPredicateNode node
    def visit_match_predicate_node(node)
      node.copy(value: visit(node.value), pattern: visit(node.pattern))
    end

    # Copy a MatchRequiredNode node
    def visit_match_required_node(node)
      node.copy(value: visit(node.value), pattern: visit(node.pattern))
    end

    # Copy a MatchWriteNode node
    def visit_match_write_node(node)
      node.copy(call: visit(node.call), targets: visit_all(node.targets))
    end

    # Copy a MissingNode node
    def visit_missing_node(node)
      node.copy
    end

    # Copy a ModuleNode node
    def visit_module_node(node)
      node.copy(constant_path: visit(node.constant_path), body: visit(node.body))
    end

    # Copy a MultiTargetNode node
    def visit_multi_target_node(node)
      node.copy(lefts: visit_all(node.lefts), rest: visit(node.rest), rights: visit_all(node.rights))
    end

    # Copy a MultiWriteNode node
    def visit_multi_write_node(node)
      node.copy(lefts: visit_all(node.lefts), rest: visit(node.rest), rights: visit_all(node.rights), value: visit(node.value))
    end

    # Copy a NextNode node
    def visit_next_node(node)
      node.copy(arguments: visit(node.arguments))
    end

    # Copy a NilNode node
    def visit_nil_node(node)
      node.copy
    end

    # Copy a NoKeywordsParameterNode node
    def visit_no_keywords_parameter_node(node)
      node.copy
    end

    # Copy a NumberedParametersNode node
    def visit_numbered_parameters_node(node)
      node.copy
    end

    # Copy a NumberedReferenceReadNode node
    def visit_numbered_reference_read_node(node)
      node.copy
    end

    # Copy a OptionalKeywordParameterNode node
    def visit_optional_keyword_parameter_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a OptionalParameterNode node
    def visit_optional_parameter_node(node)
      node.copy(value: visit(node.value))
    end

    # Copy a OrNode node
    def visit_or_node(node)
      node.copy(left: visit(node.left), right: visit(node.right))
    end

    # Copy a ParametersNode node
    def visit_parameters_node(node)
      node.copy(requireds: visit_all(node.requireds), optionals: visit_all(node.optionals), rest: visit(node.rest), posts: visit_all(node.posts), keywords: visit_all(node.keywords), keyword_rest: visit(node.keyword_rest), block: visit(node.block))
    end

    # Copy a ParenthesesNode node
    def visit_parentheses_node(node)
      node.copy(body: visit(node.body))
    end

    # Copy a PinnedExpressionNode node
    def visit_pinned_expression_node(node)
      node.copy(expression: visit(node.expression))
    end

    # Copy a PinnedVariableNode node
    def visit_pinned_variable_node(node)
      node.copy(variable: visit(node.variable))
    end

    # Copy a PostExecutionNode node
    def visit_post_execution_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a PreExecutionNode node
    def visit_pre_execution_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a ProgramNode node
    def visit_program_node(node)
      node.copy(statements: visit(node.statements))
    end

    # Copy a RangeNode node
    def visit_range_node(node)
      node.copy(left: visit(node.left), right: visit(node.right))
    end

    # Copy a RationalNode node
    def visit_rational_node(node)
      node.copy(numeric: visit(node.numeric))
    end

    # Copy a RedoNode node
    def visit_redo_node(node)
      node.copy
    end

    # Copy a RegularExpressionNode node
    def visit_regular_expression_node(node)
      node.copy
    end

    # Copy a RequiredKeywordParameterNode node
    def visit_required_keyword_parameter_node(node)
      node.copy
    end

    # Copy a RequiredParameterNode node
    def visit_required_parameter_node(node)
      node.copy
    end

    # Copy a RescueModifierNode node
    def visit_rescue_modifier_node(node)
      node.copy(expression: visit(node.expression), rescue_expression: visit(node.rescue_expression))
    end

    # Copy a RescueNode node
    def visit_rescue_node(node)
      node.copy(exceptions: visit_all(node.exceptions), reference: visit(node.reference), statements: visit(node.statements), consequent: visit(node.consequent))
    end

    # Copy a RestParameterNode node
    def visit_rest_parameter_node(node)
      node.copy
    end

    # Copy a RetryNode node
    def visit_retry_node(node)
      node.copy
    end

    # Copy a ReturnNode node
    def visit_return_node(node)
      node.copy(arguments: visit(node.arguments))
    end

    # Copy a SelfNode node
    def visit_self_node(node)
      node.copy
    end

    # Copy a ShareableConstantNode node
    def visit_shareable_constant_node(node)
      node.copy(write: visit(node.write))
    end

    # Copy a SingletonClassNode node
    def visit_singleton_class_node(node)
      node.copy(expression: visit(node.expression), body: visit(node.body))
    end

    # Copy a SourceEncodingNode node
    def visit_source_encoding_node(node)
      node.copy
    end

    # Copy a SourceFileNode node
    def visit_source_file_node(node)
      node.copy
    end

    # Copy a SourceLineNode node
    def visit_source_line_node(node)
      node.copy
    end

    # Copy a SplatNode node
    def visit_splat_node(node)
      node.copy(expression: visit(node.expression))
    end

    # Copy a StatementsNode node
    def visit_statements_node(node)
      node.copy(body: visit_all(node.body))
    end

    # Copy a StringNode node
    def visit_string_node(node)
      node.copy
    end

    # Copy a SuperNode node
    def visit_super_node(node)
      node.copy(arguments: visit(node.arguments), block: visit(node.block))
    end

    # Copy a SymbolNode node
    def visit_symbol_node(node)
      node.copy
    end

    # Copy a TrueNode node
    def visit_true_node(node)
      node.copy
    end

    # Copy a UndefNode node
    def visit_undef_node(node)
      node.copy(names: visit_all(node.names))
    end

    # Copy a UnlessNode node
    def visit_unless_node(node)
      node.copy(predicate: visit(node.predicate), statements: visit(node.statements), consequent: visit(node.consequent))
    end

    # Copy a UntilNode node
    def visit_until_node(node)
      node.copy(predicate: visit(node.predicate), statements: visit(node.statements))
    end

    # Copy a WhenNode node
    def visit_when_node(node)
      node.copy(conditions: visit_all(node.conditions), statements: visit(node.statements))
    end

    # Copy a WhileNode node
    def visit_while_node(node)
      node.copy(predicate: visit(node.predicate), statements: visit(node.statements))
    end

    # Copy a XStringNode node
    def visit_x_string_node(node)
      node.copy
    end

    # Copy a YieldNode node
    def visit_yield_node(node)
      node.copy(arguments: visit(node.arguments))
    end
  end
end
