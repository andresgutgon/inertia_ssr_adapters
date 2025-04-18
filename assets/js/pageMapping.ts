import { ComponentType, ReactNode } from "react";
import HomePage from "./pages/HomePage";

type PageModule = ComponentType<any> & {
  layout?: (_page: ReactNode) => ReactNode;
};

export const pages: Record<string, PageModule> = {
  HomePage: HomePage,
};
