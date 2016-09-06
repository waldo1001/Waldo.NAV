using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Dynamics.Framework.UI.Extensibility;

namespace Waldo.NAV.TinyMCEControl
{
    [ControlAddInExport("Waldo TinyMCE Control for NAV")]
    public interface INAVTinyMCEControl
    {
        [ApplicationVisible]
        event ApplicationEventHandler ControlAddInReady;

        [ApplicationVisible]
        event TextValueEventHandler GetHTMLReady;

        [ApplicationVisible]
        event TextValueEventHandler GetTextReady;

        [ApplicationVisible]
        event ApplicationEventHandler TextHasChanged;

        [ApplicationVisible]
        void SetHTML(string HTML);

        [ApplicationVisible]
        void GetHTML();

        [ApplicationVisible]
        void GetText();
    }
}
