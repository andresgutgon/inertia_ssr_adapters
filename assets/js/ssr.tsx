import ReactDOMServer from "react-dom/server";
import { createInertiaApp } from "@inertiajs/react";
import type { Page } from "@inertiajs/core";

export async function render(page: Page) {
  return createInertiaApp({
    page,
    resolve: async (name: string) => {
      return await import(`./pages/${name}.tsx`);
    },
    render: ReactDOMServer.renderToString,
    setup: ({ App, props }) => <App {...props} />,
  });
}
