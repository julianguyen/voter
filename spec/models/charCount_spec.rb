describe Question do
		it "should have at least 1 character" do
			Question.create(question: "a")
			#expect(Question.where(:question => "a").exists?).to eq(true)

	end
end
