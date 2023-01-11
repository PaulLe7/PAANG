interface Props {
  handleChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
  label: string;
  name: string;
  value: string;
}

export const TextInputField = ({ handleChange, label, name, value }: Props) => {
  return (
    <div>
      <label>{label}</label>
      <div>
        <input
          className="w-96 text-gray-500 border border-gray-300 rounded-md px-2 py-1 mb-4"
          onChange={handleChange}
          type="text"
          id={name}
          name={name}
          value={value}
        />
      </div>
    </div>
  );
};
