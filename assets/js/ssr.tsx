import ReactDOMServer from "react-dom/server";
import { createInertiaApp } from "@inertiajs/react";
import type { Page } from "@inertiajs/core";
import { pages } from "./pageMapping";

export async function render(page: Page) {
  return createInertiaApp({
    page,
    resolve: async (name: string) => {
      return pages[name];
    },
    render: ReactDOMServer.renderToString,
    setup: ({ App, props }) => <App {...props} />,
  });
}
