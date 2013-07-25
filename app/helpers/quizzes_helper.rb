module QuizzesHelper

  def question_parser(question_content)
    lines = question_content.split("\n").reject{|line| line.empty?}
    first_line = simple_format lines.first
    rest = lines.drop(1).join("\n")
    rest_formatted = raw Pygments.highlight(rest)
    return first_line + "\n" + rest_formatted

  end

    def example_parser(question_content)
    lines = question_content.split("\n").reject{|line| line.empty?}

    rest = lines.drop(1).join("\n")
    rest_formatted = raw Pygments.highlight(rest)
    return rest_formatted

  end

end
