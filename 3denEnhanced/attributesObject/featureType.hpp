class ENH_FeatureType
{
  control = "Combo";
  property = "ENH_featureTypeNew";
  displayName = $STR_ENH_FEATURETYPE_DISPLAYNAME;
  tooltip = $STR_ENH_FEATURETYPE_TOOLTIP;
  expression = "_this setFeatureType _value";
  defaultValue = 0;
  typeName = "NUMBER";
  class Values
  {
    class Unchanged
    {
      name = $STR_3DEN_ATTRIBUTES_DEFAULT_UNCHANGED_TEXT;
      tooltip = $STR_3DEN_ATTRIBUTES_DEFAULT_UNCHANGED_TOOLTIP;
      value = 0;
    };
    class ObjectViewDistance
    {
      name = $STR_ENH_FEATURETYPE_OBJECTVIEWDISTANCE_TEXT;
      tooltip = $STR_ENH_FEATURETYPE_OBJECTVIEWDISTANCE_TOOLTIP;
      value = 1;
    };
    class TerrainViewDistance
    {
      name = $STR_ENH_FEATURETYPE_TERRAINVIEWDISTANCE_TEXT;
      tooltip = $STR_ENH_FEATURETYPE_TERRAINVIEWDISTANCE_TOOLTIP;
      value = 2;
    };
  };
};