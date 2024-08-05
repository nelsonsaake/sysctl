// convert link to a markdown version
String _mdLink(String? v) {
  if (v == null) {
    return "";
  } else {
    return "[$v]($v)";
  }
}

// Mapping of ANSI color codes to VSCode hex colors
const Map<String, String> _ansiToVSCodeHexColorMap = {
  '30': '#000000', // Black
  '31': '#cd3131', // Red
  '32': '#0dbc79', // Green
  '33': '#e5e510', // Yellow
  '34': '#2472c8', // Blue
  '35': '#bc3fbc', // Magenta
  '36': '#11a8cd', // Cyan
  '37': '#e5e5e5', // White

  '90': '#666666', // Bright Black (Gray)
  '91': '#f14c4c', // Bright Red
  '92': '#23d18b', // Bright Green
  '93': '#f5f543', // Bright Yellow
  '94': '#3b8eea', // Bright Blue
  '95': '#d670d6', // Bright Magenta
  '96': '#29b8db', // Bright Cyan
  '97': '#e5e5e5', // Bright White
};

String? _ansiToVSCodeColor(String ansiEscapeSequence) {
  // Regular expression to match ANSI color codes
  RegExp ansiColorRegExp = RegExp(r'\x1B\[(\d+)(;\d+)*m');

  // Find the match
  RegExpMatch? match = ansiColorRegExp.firstMatch(ansiEscapeSequence);

  if (match != null) {
    // Extract the color codes from the match
    String codesString = match.group(1) ?? '';

    // Split the codes into a list
    List<String> codeList = codesString.split(';');

    // Convert each code to its VSCode hex color, assuming first code is the primary color
    String? hexColor = _ansiToVSCodeHexColorMap[codeList.first];

    return hexColor;
  } else {
    // Return null if no valid ANSI color code is found
    return null;
  }
}

// apply markdown color
// wrap text into span with the color property
String _mdColor(String? v, String? code) {
  if (v == null) {
    return "";
  }
  if (code == null) {
    return v;
  }
  return " <span color='${_ansiToVSCodeColor(code) ?? ''}'>$v</span> ";
}

// replace urls with markdown version
String _doLinks(String raw) {
  //...

  // acceptable link patterns
  const patterns = [
    r"https?:\/\/[^\s/$.?#].[^\s]*",
    r"((https?:\/\/)?([\w\-]+\.)+[a-zA-Z]{2,6}([\/\w\.-]*)*\/?)",
  ];

  // merge it into one, one wholesome search
  final pattern = patterns.join("|");

  // processor
  RegExp regex = RegExp(pattern, caseSensitive: false);

  // matches: contains a list of instances where links matching
  // at least one of the patterns was found,
  // each match contains everything you need to know about the match
  Iterable<RegExpMatch> matches = regex.allMatches(raw);

  // results
  String out = "";

  // where the last match ends
  int i = 0;

  // for each do the ff.
  for (final match in matches) {
    // write out everything that came before the match to an output
    out += raw.substring(i, match.start);

    // convert the matched link to a markdown version
    // write out the results
    out += _mdLink(match.group(0));

    // save the end out the match
    i = match.end;
  }

  // write aout everything that's left
  out += raw.substring(i);

  // return results
  return out;
}

// replace ansi code with markdown colors
String _doColors(String raw) {
  //...

  // acceptable color patterns
  const patterns = [
    r"\x1B\[[0-9;]*m",
  ];

  // merge it into one, for one wholesome search
  final pattern = patterns.join("|");

  // processor
  RegExp regex = RegExp(pattern, caseSensitive: false);

  // matches: contains a list of instances where asni_code matches
  // at least one of the patterns was found,
  // each match contains everything you need to know about the match
  Iterable<RegExpMatch> matches = regex.allMatches(raw);

  // results
  String out = "";

  // where the last match ends
  int i = 0;

  // last color code
  String? colorCode;

  // for each do the ff.
  for (final match in matches) {
    // apply the colorCode to everything that came before the match
    // the match indicates, start of a color change and
    // write out everything that came before the match to an output
    out += _mdColor(raw.substring(i, match.start), colorCode);

    // the current match become the new colorCode, that will be used in the next match
    colorCode = match.group(0);

    // save the end out the match
    i = match.end;
  }

  // apply the colorCode to everything that's left
  // write it out
  out += _mdColor(raw.substring(i), colorCode);

  // return results
  return out;
}

// replace raw line breaks with, markdown line break
String _doLineBreaks(String raw) {
  // the starting point, is the original input
  String out = raw;

  // any of this in a body of text means break line
  const brks = ["\r\n", "\n\r", "\r", "\n"];

  // swap them out for the markdown equivalent
  for (var brk in brks) {
    out = out.replaceAll(brk, r"<br>");
  }

  // return the results
  return out;
}

String _doAnsiEscape(String raw) {
  // acceptable color patterns
  const patterns = [
    // r"\x1B\[[0-9;]*m",
    r'\x1B[@-_][0-9;]*[ -/]*[@-~]|\x1Bc',
    // r'\x1B[@-_][0-9;]*[ -/]*[A-Za-z][@-~]',
  ];

  // merge it into one, for one wholesome search
  final pattern = patterns.join("|");

  // processor
  RegExp regex = RegExp(pattern, caseSensitive: false);

  // remove ansi color code and return the results
  return raw.replaceAll(regex, "");
}

String toMD(String raw) {
  var out = raw;
  final processors = [
    _doAnsiEscape,
    // _doLineBreaks,
  ];
  for (var processor in processors) {
    out = processor(out);
  }
  return out;
}
