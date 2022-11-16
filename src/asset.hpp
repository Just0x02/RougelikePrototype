#ifndef __ASSET_H__
#define __ASSET_H__

#include <SFML/Graphics.hpp>
#include <vector>
#include <string.h>
#include <algorithm>
#include <alchemy/types.hpp>
#include <alchemy/cstd/alcio.h>

namespace Engine
{
	enum AssetType : u8
	{
		IMAGE_PNG = 0x0A
	};

	struct Asset
	{
		const char *file_source;
		AssetType type;

		inline bool operator==(const Asset &other) const
		{
			return strcmp(this->file_source, other.file_source) == 0;
		}

		inline sf::Image load_image() const
		{
			sf::Image img;

			img.loadFromFile(this->file_source);

			return img;
		}

		inline std::vector<byte_t> load_bytes() const
		{
			u64 bytes_read = 0x0;
			byte_t *bytes = alc::read_file_bytes(this->file_source, &bytes_read);

			std::vector<byte_t> byte_vec(bytes, bytes + bytes_read);

			free(bytes);

			return byte_vec;
		}
	};
};

#endif // __ASSET_H__