import { render, screen } from "@testing-library/react";
import AddItem from "../src/AddItem";

const empty = () => {};

test("Renders Input Form", () => {
  render(<AddItem addItem={empty} />);

  const linkElement = screen.getByText("Task:");
  expect(linkElement).toBeInTheDocument();

  const priorityElement = screen.getByText("Priority:");
  expect(priorityElement).toBeInTheDocument();
});