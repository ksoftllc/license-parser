import Foundation

/**
  AAMVA Issuing Countries

  - UnitedStates: The USA
  - Canda: Canada, eh?
  - Unknown: When the issuing country is not available
*/
public enum IssuingCountry{
  /// The United States
  case UnitedStates

  /// Canada
  case Canada

  /// Unknown Issuing Country
  case Unknown
}

/**
  AAMVA Genders

  - Male: Male
  - Female: Female
  - Other: Not yet part of the AAMVA spec
  - Unknown: When the gender cannot be determined
*/
public enum Gender{

  /// Male
  case Male

  /// Female
  case Female

  /// Other
  case Other

  /// Unknown Gender
  case Unknown
}

/**
  AAMVA Eye Colors

  - Black: Black eyes
  - Blue: Blue eyes
  - Brown: Brown eyes
  - Gray: Gray eyes
  - Green: Green eyes
  - Hazel: Hazel eyes
  - Maroon: Maroon eyes
  - Pink: Pink eyes
  - Dichromatic: Dichromatic eyes
  - Unknown: Unknown eye color
*/
public enum EyeColor{
  /// Black eye color
  case Black
  /// Blue eye color
  case Blue
  /// Brown eye color
  case Brown
  /// Gray eye color
  case Gray
  /// Green eye color
  case Green
  /// Hazel eye color
  case Hazel
  /// Maroon eye color
  case Maroon
  /// Pink eye color
  case Pink
  /// Dichromatic eye color
  case Dichromatic
  /// Unknown eye color
  case Unknown
}

/**
  AAMVA hair colors

  - Bald: Bald hair
  - Black: Black hair
  - Blond: Blond hair
  - Brown: Brown hair
  - Grey: Grey hair
  - Red: Red hair
  - Sandy: Sandy hair
  - White: White hair
  - Unknown: Unknown hair color
*/
public enum HairColor{
  /// Bald hair color
  case Bald
  /// Black hair color
  case Black
  /// Blond hair color
  case Blond
  /// Brown hair color
  case Brown
  /// Grey hair color
  case Grey
  /// Red hair color
  case Red
  /// Sandy hair color
  case Sandy
  /// White hair color
  case White
  /// Unknown hair color
  case Unknown
}

/**
  AAMVA Name Truncations

  - Truncated: The name was truncated
  - None: The name was not truncated
  - Unknown: When the truncation cannot be determined
*/
public enum Truncation{
  /// Truncated Name
  case Truncated
  /// Not Truncated
  case None
  /// Unknown Truncation
  case Unknown
}

/**
  AAMVA Name Suffixes

  - Junior: Junior, Jr.
  - Senior: Senior, Sr.
  - First: First, I, 1st
  - Second: Second, II, 2nd
  - Third: Third, III, 3rd
  - Fourth: Fourth, IV, 4th
  - Fifth: Fifth, V, 5th
  - Sixth: Sixth, VI, 6th
  - Seventh: Seventh, VII, 7th
  - Eighth: Eighth, VIII, 8th
  - Ninth: Ninth, IX, 9th
  - Unknown: When the name suffix is unknown
*/
public enum NameSuffix{
  /// Junior, Jr.
  case Junior
  /// Senior, Sr.
  case Senior
  /// First, I, 1st
  case First
  /// Second, II, 2nd
  case Second
  /// Third, III, 3rd
  case Third
  /// Fourth, IV, 4th
  case Fourth
  /// Fifth, V, 5th
  case Fifth
  /// Sixth, VI, 6th
  case Sixth
  /// Seventh, VII, 7th
  case Seventh
  /// Eighth, VIII, 8th
  case Eighth
  /// Ninth, IX, 9th
  case Ninth
  /// When the name suffix is unknown
  case Unknown
}
