defmodule XmlParsingTest do
  use ExUnit.Case
  doctest XmlParsing

  def example_xml do 
     """
    <html>
      <head>
        <title>XML Parsing</title>
      </head>
      <body>
        <p>Neato</p>
        <ul>
          <li>First</li>
          <li>Second</li>
        </ul>
      </body>
    </html>
    """
  end

  test "parsing the title out" do 
    assert :xmlerl_scan.string(bitstring_to_list(example_xml())) == :foo
  end

end
