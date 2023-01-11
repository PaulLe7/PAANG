import type { AppProps } from "next/app";
import { ApolloProvider } from "@apollo/client";
import client from "./_apollo-client";
import "../styles/globals.css";

const App: React.ComponentType<AppProps> = ({ Component, pageProps }) => {
  return (
    <ApolloProvider client={client}>
      <Component {...pageProps} />
    </ApolloProvider>
  );
};

export default  App;
