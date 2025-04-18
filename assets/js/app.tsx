import { StrictMode } from "react";
import { createRoot, hydrateRoot } from "react-dom/client";
import axios from "axios";
import { createInertiaApp } from "@inertiajs/react";
import { pages } from "./pageMapping";

axios.defaults.xsrfHeaderName = "x-csrf-token";

createInertiaApp({
  resolve: async (name: string) => {
    return pages[name];
  },
  setup({ App, el, props }) {
    if (props.initialPage.props.ssr) {
      hydrateRoot(
        el,
        <StrictMode>
          <App {...props} />
        </StrictMode>,
      );
    } else {
      createRoot(el).render(
        <StrictMode>
          <App {...props} />
        </StrictMode>,
      );
    }
  },
});
