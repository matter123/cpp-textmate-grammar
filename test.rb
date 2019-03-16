require_relative './readable_grammar.rb'
cpp_grammar = Grammar.new(
    name:"C++",
    scope_name: "source.cpp",
    version: "https://github.com/jeff-hykin/cpp-textmate-grammar/blob/master/generate.rb",
    information_for_contributors: [
        "This code was auto generated by a much-more-readble ruby file: https://github.com/jeff-hykin/cpp-textmate-grammar/blob/master/generate.rb",
        "It is a lot easier to modify the ruby file and have it generate the rest of the code",
        "Also the ruby source is very open to merge requests, so please make one if something could be improved",
        "This file essentially an updated/improved fork of the atom syntax https://github.com/atom/language-c/blob/master/grammars/c%2B%2B.cson",
    ],
)
#
# Variable
#
    # todo: make a better name for this function
    variableBounds = ->(regex_pattern) do
        lookBehindToAvoid(@standard_character).then(regex_pattern).lookAheadToAvoid(@standard_character)
    end
    variable_name_without_bounds = /[a-zA-Z_]#{@standard_character.without_default_mode_modifiers}*/
    # word bounds are inefficient, but they are accurate
    variable_name = variableBounds[variable_name_without_bounds]
#variable end

number_seperator_pattern = newPattern(
    repository_name: 'literal_numeric_seperator',
    match: lookBehindToAvoid(/'/).then(/'/).lookAheadToAvoid(/'/),
    tag_as:"punctuation.separator.constant.numeric"
    )

p "''" =~ number_seperator_pattern