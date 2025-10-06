class ENH_ModuleInformation
{
    idd = IDD_MODULEINFORMATION;
    onLoad = "_this call ENH_fnc_MI_onLoad";
    class ControlsBackground
    {
        DISABLE_BACKGROUND
        class Header: ctrlStaticTitle
        {
            text = "$STR_ENH_MAIN_MODULEINFORMATION";
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W);
            y = QUOTE(WINDOW_TOPAbs);
            w = QUOTE(WINDOW_W_ATTRIBUTES * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
            moving = 0;
        };
        class Background: ctrlStaticBackground
        {
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W);
            y = QUOTE(WINDOW_TOPAbs + CTRL_DEFAULT_H);
            w = QUOTE(WINDOW_W_ATTRIBUTES * GRID_W);
            h = QUOTE(WINDOW_HAbs - 3 * CTRL_DEFAULT_H);
        };
        class BackgroundSyncPreview: ctrlStaticBackground
        {
            idc = IDC_MODULEINFORMATION_SYNC_BACKGROUND;
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W + 1 * GRID_W);
            y = QUOTE(WINDOW_TOPAbs + 0.3 * WINDOW_HAbs + CTRL_DEFAULT_H + 2 * GRID_H);
            w = QUOTE((WINDOW_W_ATTRIBUTES - 2) * GRID_W);
            h = QUOTE(0.7 * WINDOW_HAbs - 5 * CTRL_DEFAULT_H);
            colorBackground[] = {COLOR_OVERLAY_RGBA};
        };
        class Footer: ctrlStaticFooter
        {
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W);
            y = QUOTE(WINDOW_TOPAbs + WINDOW_HAbs - 3 * CTRL_DEFAULT_H - 2 * GRID_H);
            w = QUOTE(WINDOW_W_ATTRIBUTES * GRID_W);
            h = QUOTE(7 * GRID_H);
        };
    };
    class Controls
    {
        class Group: ctrlControlsGroup
        {
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W + 1 * GRID_W);
            y = QUOTE(WINDOW_TOPAbs + 6 * GRID_H);
            w = QUOTE((WINDOW_W_ATTRIBUTES - 2) * GRID_W);
            h = QUOTE(0.3 * WINDOW_HAbs);
            class Controls
            {
                class DescriptionValue: ctrlStructuredText
                {
                    idc = IDC_MODULEINFORMATION_DESCRIPTION;
                    x = 0;
                    y = 0;
                    w = QUOTE((WINDOW_W_ATTRIBUTES - 2) * GRID_W);
                    h = QUOTE(0.5 * WINDOW_HAbs);
                    colorBackground[] = {COLOR_OVERLAY_RGBA};
                };
            };
        };
        class Close: ctrlButtonClose
        {
            x = QUOTE(CENTER_X - 0.5 * WINDOW_W_ATTRIBUTES * GRID_W + (WINDOW_W_ATTRIBUTES - 26) * GRID_W);
            y = QUOTE(WINDOW_TOPAbs + WINDOW_HAbs - 3 * CTRL_DEFAULT_H - GRID_H);
            w = QUOTE(25 * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
        };
    };
};
