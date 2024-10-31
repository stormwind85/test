try {
    const gitlabResponse = await fetch("https://${{ vars.GITLAB_DOMAIN }}/api/v4/projects/${{ vars.GITLAB_PROJECT_ID }}/merge_requests?state=merged&target_branch=develop&milestone=${{ github.event.release.tag_name }}", {
      method: "GET",
      headers: {
        "Private-Token": "${{ secrets.GITLAB_API_TOKEN }}"
      }
    });

    if (!gitlabResponse.ok) {
        const err = await gitlabResponse.json();
        throw new Error("Failed to send message: " + JSON.stringify(err));
    }

    const mergeRequests = await gitlabResponse.json();
    const tickets = [];

    mergeRequests.forEach((mr) => {
      const matches = mr.source_branch.match(/EC-\d+/);
      if(matches.length) {
        tickets.push(matches[0].toUpperCase());
      }
    });

    console.log("tickets", tickets);

    tickets.forEach((ticket) => {
      payload.blocks[2].elements[0].elements.push({
        "type": "rich_text_section",
        "elements": [
          {
            "type": "link",
            "url": "https://${{ vars.JIRA_DOMAIN }}/browse/" + ticket,
            "text": ticket
          }
        ]
      });
    });
} catch (error) {
    console.error("Request error", error.message);
}