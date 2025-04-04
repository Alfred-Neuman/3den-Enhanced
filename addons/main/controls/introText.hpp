class ENH_IntroText: Title
{
    attributeLoad = "[_this, _value] call ENH_fnc_introText_onAttributeLoad";
    attributeSave = "_this call ENH_fnc_introText_onAttributeSave";
    h = QUOTE(10 * CTRL_DEFAULT_H + 30 * pixelH);
    class Controls: Controls
    {
        class DelayTitle: Title
        {
            text = "$STR_ENH_MAIN_INTROTEXT_INTRODELAY_DISPLAYNAME";
            tooltip = "$STR_ENH_MAIN_INTROTEXT_INTRODELAY_TOOLTIP";
        };
        class DelayValue: ctrlXSliderH
        {
            idc = 100;
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE((ATTRIBUTE_CONTENT_W - EDIT_W_WIDE) * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
             sliderPosition = 0;
            sliderRange[] = {0, 360};
            sliderStep = 1;
            lineSize = 1;
        };
        class DelayEdit: ctrlEdit
        {
            idc = 101;
            x = QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W - EDIT_W_WIDE) * GRID_W);
            w = QUOTE(EDIT_W_WIDE * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
        };
        class Line1Title: Title
        {
            y = QUOTE(CTRL_DEFAULT_H + 5 * pixelH);
            text = "$STR_ENH_MAIN_INTROTEXT_LINE1_DISPLAYNAME";
        };
        class Line1Value: ctrlEdit
        {
            idc = 102;
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            y = QUOTE(CTRL_DEFAULT_H + 5 * pixelH);
            w = QUOTE(ATTRIBUTE_CONTENT_W * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
        };
        class Line2Title: Title
        {
            y = QUOTE(2 * CTRL_DEFAULT_H + 10 * pixelH);
            text = "$STR_ENH_MAIN_INTROTEXT_LINE2_DISPLAYNAME";
            tooltip = "";
        };
        class Line2Value: Line1Value
        {
            idc = 103;
            y = QUOTE(2 * CTRL_DEFAULT_H + 10 * pixelH);
        };
        class Line3Title: Title
        {
            y = QUOTE(3 * CTRL_DEFAULT_H + 15 * pixelH);
            text = "$STR_ENH_MAIN_INTROTEXT_LINE3_DISPLAYNAME";
        };
        class Line3Value: Line1Value
        {
            idc = 104;
            y = QUOTE(3 * CTRL_DEFAULT_H + 15 * pixelH);
        };
        class IntroTypeTitle: Title
        {
            y = QUOTE(4 * CTRL_DEFAULT_H + 20 * pixelH);
            text = "$STR_ENH_MAIN_INTROTEXT_INTROTYPE_DISPLAYNAME";
        };
        class IntroType: ctrlToolboxPictureKeepAspect
        {
            idc = 105;
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            y = QUOTE(4 * CTRL_DEFAULT_H + 20 * pixelH);
            w = QUOTE(ATTRIBUTE_CONTENT_W * GRID_W);
            h = QUOTE(5 * CTRL_DEFAULT_H);
            rows = 1;
            columns = 3;
            strings[] =
            {
                "x\enh\addons\main\data\BIS_fnc_textTiles_preview_ca.paa",
                "x\enh\addons\main\data\BIS_fnc_infoText_preview_ca.paa",
                "x\enh\addons\main\data\BIS_fnc_EXP_camp_SITREP_preview_ca.paa"
            };
            values[] = {0, 1, 2};
        };
        class Reset: ENH_3DEN_Attribute_Control_ResetButton
        {
            y = QUOTE(9 * CTRL_DEFAULT_H + 25 * pixelH);
        };
    };
};
